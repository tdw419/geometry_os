; DESCRIPTION: Composite: . Then Creates a cyan rectangular region at (46, 158) spanning 68 by 60 pixels. Then Places a yellow dot at position (119, 140).
; PLAN: r0=46(x), r1=158(y), r2=68(width), r3=60(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=119(x), r1=140(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a cyan rectangular region at (46, 158) spanning 68 by 60 pixels.
; PLAN: r0=46(x), r1=158(y), r2=68(width), r3=60(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 158
LDI r2, 68
LDI r3, 60
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a yellow dot at position (119, 140).
; PLAN: r0=119(x), r1=140(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 119
LDI r1, 140
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
