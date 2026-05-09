; DESCRIPTION: Composite: . Then Places a orange 50x20 rectangle at position (68, 220). Then Draws a green line from (203, 80) to (82, 150).
; PLAN: r0=68(x), r1=220(y), r2=50(width), r3=20(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=203(x1), r1=80(y1), r2=82(x2), r3=150(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a orange 50x20 rectangle at position (68, 220).
; PLAN: r0=68(x), r1=220(y), r2=50(width), r3=20(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 220
LDI r2, 50
LDI r3, 20
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a green line from (203, 80) to (82, 150).
; PLAN: r0=203(x1), r1=80(y1), r2=82(x2), r3=150(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 80
LDI r2, 82
LDI r3, 150
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
