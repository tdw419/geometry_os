; DESCRIPTION: Composite: . Then Draws a cyan line from (125, 188) to (131, 9). Then Places a black 30x27 rectangle at position (152, 48).
; PLAN: r0=125(x1), r1=188(y1), r2=131(x2), r3=9(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=152(x), r1=48(y), r2=30(width), r3=27(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a cyan line from (125, 188) to (131, 9).
; PLAN: r0=125(x1), r1=188(y1), r2=131(x2), r3=9(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 188
LDI r2, 131
LDI r3, 9
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a black 30x27 rectangle at position (152, 48).
; PLAN: r0=152(x), r1=48(y), r2=30(width), r3=27(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 48
LDI r2, 30
LDI r3, 27
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
