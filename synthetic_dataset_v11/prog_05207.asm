; DESCRIPTION: Composite: . Then Creates a red rectangular region at (137, 229) spanning 61 by 10 pixels. Then Places a black dot at position (133, 200).
; PLAN: r0=137(x), r1=229(y), r2=61(width), r3=10(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=133(x), r1=200(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a red rectangular region at (137, 229) spanning 61 by 10 pixels.
; PLAN: r0=137(x), r1=229(y), r2=61(width), r3=10(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 229
LDI r2, 61
LDI r3, 10
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a black dot at position (133, 200).
; PLAN: r0=133(x), r1=200(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 133
LDI r1, 200
LDI r2, 0x000000
PSET r0, r1, r2
HALT
