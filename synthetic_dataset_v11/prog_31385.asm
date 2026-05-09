; DESCRIPTION: Composite: . Then Creates a cyan rectangular region at (166, 115) spanning 43 by 38 pixels. Then Draws a green line from (203, 246) to (215, 104).
; PLAN: r0=166(x), r1=115(y), r2=43(width), r3=38(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=203(x1), r1=246(y1), r2=215(x2), r3=104(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a cyan rectangular region at (166, 115) spanning 43 by 38 pixels.
; PLAN: r0=166(x), r1=115(y), r2=43(width), r3=38(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 115
LDI r2, 43
LDI r3, 38
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a green line from (203, 246) to (215, 104).
; PLAN: r0=203(x1), r1=246(y1), r2=215(x2), r3=104(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 246
LDI r2, 215
LDI r3, 104
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
