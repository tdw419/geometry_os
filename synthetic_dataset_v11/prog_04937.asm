; DESCRIPTION: Composite: . Then Places a black line segment connecting (173, 173) to (47, 39). Then Creates a cyan rectangular region at (21, 26) spanning 104 by 41 pixels.
; PLAN: r0=173(x1), r1=173(y1), r2=47(x2), r3=39(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=21(x), r1=26(y), r2=104(width), r3=41(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a black line segment connecting (173, 173) to (47, 39).
; PLAN: r0=173(x1), r1=173(y1), r2=47(x2), r3=39(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 173
LDI r2, 47
LDI r3, 39
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a cyan rectangular region at (21, 26) spanning 104 by 41 pixels.
; PLAN: r0=21(x), r1=26(y), r2=104(width), r3=41(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 26
LDI r2, 104
LDI r3, 41
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
