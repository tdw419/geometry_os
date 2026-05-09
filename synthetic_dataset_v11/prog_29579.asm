; DESCRIPTION: Composite: . Then Draws a white line from (60, 166) to (57, 74). Then Sets a single green pixel at (168, 128).
; PLAN: r0=60(x1), r1=166(y1), r2=57(x2), r3=74(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=168(x), r1=128(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a white line from (60, 166) to (57, 74).
; PLAN: r0=60(x1), r1=166(y1), r2=57(x2), r3=74(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 166
LDI r2, 57
LDI r3, 74
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single green pixel at (168, 128).
; PLAN: r0=168(x), r1=128(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 168
LDI r1, 128
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
