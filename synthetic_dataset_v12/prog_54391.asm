; DESCRIPTION: Renders a white box of size 24x27 starting at (320, 172).
; PLAN: r0=320(x), r1=172(y), r2=24(width), r3=27(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 172
LDI r2, 24
LDI r3, 27
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
