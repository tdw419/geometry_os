; DESCRIPTION: Renders a red box of size 33x90 starting at (272, 136).
; PLAN: r0=272(x), r1=136(y), r2=33(width), r3=90(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 136
LDI r2, 33
LDI r3, 90
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
