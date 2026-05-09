; DESCRIPTION: Composite: . Then Sets a single green pixel at (152, 91). Then Creates a magenta rectangular region at (2, 107) spanning 16 by 99 pixels.
; PLAN: r0=152(x), r1=91(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=2(x), r1=107(y), r2=16(width), r3=99(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single green pixel at (152, 91).
; PLAN: r0=152(x), r1=91(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 152
LDI r1, 91
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Creates a magenta rectangular region at (2, 107) spanning 16 by 99 pixels.
; PLAN: r0=2(x), r1=107(y), r2=16(width), r3=99(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 107
LDI r2, 16
LDI r3, 99
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
