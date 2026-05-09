; DESCRIPTION: Renders a cyan box of size 51x98 starting at (434, 109).
; PLAN: r0=434(x), r1=109(y), r2=51(width), r3=98(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 109
LDI r2, 51
LDI r3, 98
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
