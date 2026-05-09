; DESCRIPTION: Composite: . Then Sets a single red pixel at (195, 213). Then Draws a cyan line from (215, 16) to (157, 2).
; PLAN: r0=195(x), r1=213(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=215(x1), r1=16(y1), r2=157(x2), r3=2(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single red pixel at (195, 213).
; PLAN: r0=195(x), r1=213(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 195
LDI r1, 213
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Draws a cyan line from (215, 16) to (157, 2).
; PLAN: r0=215(x1), r1=16(y1), r2=157(x2), r3=2(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 16
LDI r2, 157
LDI r3, 2
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
