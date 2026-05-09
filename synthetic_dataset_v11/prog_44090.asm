; DESCRIPTION: Composite: . Then Creates a black rectangular region at (91, 27) spanning 104 by 110 pixels. Then Places a cyan line segment connecting (26, 58) to (239, 176).
; PLAN: r0=91(x), r1=27(y), r2=104(width), r3=110(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=26(x1), r1=58(y1), r2=239(x2), r3=176(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a black rectangular region at (91, 27) spanning 104 by 110 pixels.
; PLAN: r0=91(x), r1=27(y), r2=104(width), r3=110(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 27
LDI r2, 104
LDI r3, 110
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a cyan line segment connecting (26, 58) to (239, 176).
; PLAN: r0=26(x1), r1=58(y1), r2=239(x2), r3=176(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 58
LDI r2, 239
LDI r3, 176
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
