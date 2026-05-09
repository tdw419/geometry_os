; DESCRIPTION: Composite: . Then Draws a cyan line from (10, 117) to (215, 45). Then Draws a cyan rectangle at (152, 15) with width 63 and height 43.
; PLAN: r0=10(x1), r1=117(y1), r2=215(x2), r3=45(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=152(x), r1=15(y), r2=63(width), r3=43(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a cyan line from (10, 117) to (215, 45).
; PLAN: r0=10(x1), r1=117(y1), r2=215(x2), r3=45(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 117
LDI r2, 215
LDI r3, 45
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a cyan rectangle at (152, 15) with width 63 and height 43.
; PLAN: r0=152(x), r1=15(y), r2=63(width), r3=43(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 15
LDI r2, 63
LDI r3, 43
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
