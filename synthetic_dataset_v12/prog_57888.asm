; DESCRIPTION: Renders a blue box of size 120x77 starting at (27, 60).
; PLAN: r0=27(x), r1=60(y), r2=120(width), r3=77(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 60
LDI r2, 120
LDI r3, 77
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
