; DESCRIPTION: Composite: . Then Draws a cyan line from (217, 31) to (33, 3). Then Places a black 98x10 rectangle at position (54, 6).
; PLAN: r0=217(x1), r1=31(y1), r2=33(x2), r3=3(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=54(x), r1=6(y), r2=98(width), r3=10(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a cyan line from (217, 31) to (33, 3).
; PLAN: r0=217(x1), r1=31(y1), r2=33(x2), r3=3(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 31
LDI r2, 33
LDI r3, 3
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a black 98x10 rectangle at position (54, 6).
; PLAN: r0=54(x), r1=6(y), r2=98(width), r3=10(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 6
LDI r2, 98
LDI r3, 10
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
