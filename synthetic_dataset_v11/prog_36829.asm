; DESCRIPTION: Composite: . Then Draws a black line from (39, 28) to (166, 14). Then Places a orange dot at position (70, 68).
; PLAN: r0=39(x1), r1=28(y1), r2=166(x2), r3=14(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=70(x), r1=68(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a black line from (39, 28) to (166, 14).
; PLAN: r0=39(x1), r1=28(y1), r2=166(x2), r3=14(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 28
LDI r2, 166
LDI r3, 14
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a orange dot at position (70, 68).
; PLAN: r0=70(x), r1=68(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 70
LDI r1, 68
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
