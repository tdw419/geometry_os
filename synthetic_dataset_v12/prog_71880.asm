; DESCRIPTION: Renders a cyan box of size 56x20 starting at (434, 51).
; PLAN: r0=434(x), r1=51(y), r2=56(width), r3=20(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 51
LDI r2, 56
LDI r3, 20
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
