; DESCRIPTION: Composite: . Then Places a orange dot at position (193, 204). Then Draws a white line from (103, 62) to (205, 245).
; PLAN: r0=193(x), r1=204(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=103(x1), r1=62(y1), r2=205(x2), r3=245(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a orange dot at position (193, 204).
; PLAN: r0=193(x), r1=204(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 193
LDI r1, 204
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Draws a white line from (103, 62) to (205, 245).
; PLAN: r0=103(x1), r1=62(y1), r2=205(x2), r3=245(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 62
LDI r2, 205
LDI r3, 245
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
