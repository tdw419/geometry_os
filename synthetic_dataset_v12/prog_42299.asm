; DESCRIPTION: Renders a red box of size 51x32 starting at (354, 219).
; PLAN: r0=354(x), r1=219(y), r2=51(width), r3=32(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 219
LDI r2, 51
LDI r3, 32
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
