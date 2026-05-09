; DESCRIPTION: Composite: Renders a white line between points (101, 206) and (218, 151) then Renders a yellow box of size 53x52 starting at (320, 203).
; PLAN: r0=101(x1), r1=206(y1), r2=218(x2), r3=151(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=320(x), r6=203(y), r7=53(width), r8=52(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 101
LDI r1, 206
LDI r2, 218
LDI r3, 151
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 320
LDI r6, 203
LDI r7, 53
LDI r8, 52
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
