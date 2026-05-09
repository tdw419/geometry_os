; DESCRIPTION: Composite: . Then Sets a single green pixel at (107, 213). Then Draws a red line from (39, 188) to (103, 42).
; PLAN: r0=107(x), r1=213(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=39(x1), r1=188(y1), r2=103(x2), r3=42(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single green pixel at (107, 213).
; PLAN: r0=107(x), r1=213(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 107
LDI r1, 213
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Draws a red line from (39, 188) to (103, 42).
; PLAN: r0=39(x1), r1=188(y1), r2=103(x2), r3=42(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 188
LDI r2, 103
LDI r3, 42
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
