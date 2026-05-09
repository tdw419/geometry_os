; DESCRIPTION: Composite: . Then Draws a white line from (72, 205) to (80, 103). Then Places a black dot at position (223, 27).
; PLAN: r0=72(x1), r1=205(y1), r2=80(x2), r3=103(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=223(x), r1=27(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a white line from (72, 205) to (80, 103).
; PLAN: r0=72(x1), r1=205(y1), r2=80(x2), r3=103(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 205
LDI r2, 80
LDI r3, 103
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a black dot at position (223, 27).
; PLAN: r0=223(x), r1=27(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 223
LDI r1, 27
LDI r2, 0x000000
PSET r0, r1, r2
HALT
