; DESCRIPTION: Composite: . Then Places a cyan 61x55 rectangle at position (65, 49). Then Places a green dot at position (101, 157).
; PLAN: r0=65(x), r1=49(y), r2=61(width), r3=55(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=101(x), r1=157(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a cyan 61x55 rectangle at position (65, 49).
; PLAN: r0=65(x), r1=49(y), r2=61(width), r3=55(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 49
LDI r2, 61
LDI r3, 55
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a green dot at position (101, 157).
; PLAN: r0=101(x), r1=157(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 101
LDI r1, 157
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
