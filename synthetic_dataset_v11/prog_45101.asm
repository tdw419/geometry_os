; DESCRIPTION: Composite: . Then Places a cyan dot at position (66, 42). Then Draws a red line from (125, 206) to (174, 24).
; PLAN: r0=66(x), r1=42(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=125(x1), r1=206(y1), r2=174(x2), r3=24(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a cyan dot at position (66, 42).
; PLAN: r0=66(x), r1=42(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 66
LDI r1, 42
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Draws a red line from (125, 206) to (174, 24).
; PLAN: r0=125(x1), r1=206(y1), r2=174(x2), r3=24(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 206
LDI r2, 174
LDI r3, 24
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
