; DESCRIPTION: Renders a cyan box of size 94x111 starting at (178, 51).
; PLAN: r0=178(x), r1=51(y), r2=94(width), r3=111(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 51
LDI r2, 94
LDI r3, 111
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
