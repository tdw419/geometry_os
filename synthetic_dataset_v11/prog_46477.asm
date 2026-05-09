; DESCRIPTION: Composite: . Then Places a cyan 32x55 rectangle at position (194, 172). Then Places a magenta dot at position (138, 116).
; PLAN: r0=194(x), r1=172(y), r2=32(width), r3=55(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=138(x), r1=116(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a cyan 32x55 rectangle at position (194, 172).
; PLAN: r0=194(x), r1=172(y), r2=32(width), r3=55(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 172
LDI r2, 32
LDI r3, 55
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a magenta dot at position (138, 116).
; PLAN: r0=138(x), r1=116(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 138
LDI r1, 116
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
