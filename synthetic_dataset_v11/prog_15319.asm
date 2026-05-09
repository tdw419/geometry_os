; DESCRIPTION: Composite: . Then Places a yellow 40x45 rectangle at position (70, 42). Then Places a black dot at position (225, 218).
; PLAN: r0=70(x), r1=42(y), r2=40(width), r3=45(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=225(x), r1=218(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a yellow 40x45 rectangle at position (70, 42).
; PLAN: r0=70(x), r1=42(y), r2=40(width), r3=45(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 42
LDI r2, 40
LDI r3, 45
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a black dot at position (225, 218).
; PLAN: r0=225(x), r1=218(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 225
LDI r1, 218
LDI r2, 0x000000
PSET r0, r1, r2
HALT
