; DESCRIPTION: Composite: . Then Places a green dot at position (246, 142). Then Creates a red rectangular region at (30, 33) spanning 50 by 58 pixels.
; PLAN: r0=246(x), r1=142(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=30(x), r1=33(y), r2=50(width), r3=58(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a green dot at position (246, 142).
; PLAN: r0=246(x), r1=142(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 246
LDI r1, 142
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Creates a red rectangular region at (30, 33) spanning 50 by 58 pixels.
; PLAN: r0=30(x), r1=33(y), r2=50(width), r3=58(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 33
LDI r2, 50
LDI r3, 58
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
