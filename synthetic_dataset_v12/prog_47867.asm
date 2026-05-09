; DESCRIPTION: Composite: Places a blue dot at position (356, 181) then Renders a green box of size 33x97 starting at (320, 37).
; PLAN: r0=356(x), r1=181(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=320(x), r6=37(y), r7=33(width), r8=97(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 356
LDI r1, 181
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 320
LDI r6, 37
LDI r7, 33
LDI r8, 97
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
