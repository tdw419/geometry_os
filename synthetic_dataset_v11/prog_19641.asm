; DESCRIPTION: Composite: . Then Creates a red circular shape at (126, 177) with radius 36. Then Draws a green line from (192, 221) to (134, 171).
; PLAN: r0=126(x), r1=177(y), r2=36(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=192(x1), r1=221(y1), r2=134(x2), r3=171(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a red circular shape at (126, 177) with radius 36.
; PLAN: r0=126(x), r1=177(y), r2=36(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 126
LDI r1, 177
LDI r2, 36
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a green line from (192, 221) to (134, 171).
; PLAN: r0=192(x1), r1=221(y1), r2=134(x2), r3=171(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 221
LDI r2, 134
LDI r3, 171
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
