; DESCRIPTION: Composite: . Then Draws a cyan line from (90, 165) to (226, 221). Then Places a white dot at position (70, 42).
; PLAN: r0=90(x1), r1=165(y1), r2=226(x2), r3=221(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=70(x), r1=42(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a cyan line from (90, 165) to (226, 221).
; PLAN: r0=90(x1), r1=165(y1), r2=226(x2), r3=221(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 165
LDI r2, 226
LDI r3, 221
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a white dot at position (70, 42).
; PLAN: r0=70(x), r1=42(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 70
LDI r1, 42
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
