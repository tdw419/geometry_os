; DESCRIPTION: Composite: . Then Places a green line segment connecting (61, 231) to (233, 184). Then Creates a white rectangular region at (102, 104) spanning 104 by 113 pixels.
; PLAN: r0=61(x1), r1=231(y1), r2=233(x2), r3=184(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=102(x), r1=104(y), r2=104(width), r3=113(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a green line segment connecting (61, 231) to (233, 184).
; PLAN: r0=61(x1), r1=231(y1), r2=233(x2), r3=184(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 231
LDI r2, 233
LDI r3, 184
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a white rectangular region at (102, 104) spanning 104 by 113 pixels.
; PLAN: r0=102(x), r1=104(y), r2=104(width), r3=113(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 104
LDI r2, 104
LDI r3, 113
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
