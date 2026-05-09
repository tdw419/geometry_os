; DESCRIPTION: Composite: . Then Places a purple 42x46 rectangle at position (33, 157). Then Sets a single orange pixel at (108, 242).
; PLAN: r0=33(x), r1=157(y), r2=42(width), r3=46(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=108(x), r1=242(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a purple 42x46 rectangle at position (33, 157).
; PLAN: r0=33(x), r1=157(y), r2=42(width), r3=46(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 157
LDI r2, 42
LDI r3, 46
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single orange pixel at (108, 242).
; PLAN: r0=108(x), r1=242(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 108
LDI r1, 242
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
