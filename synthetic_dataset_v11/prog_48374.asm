; DESCRIPTION: Composite: . Then Places a yellow dot at position (173, 219). Then Creates a cyan rectangular region at (96, 93) spanning 93 by 104 pixels.
; PLAN: r0=173(x), r1=219(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=96(x), r1=93(y), r2=93(width), r3=104(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a yellow dot at position (173, 219).
; PLAN: r0=173(x), r1=219(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 173
LDI r1, 219
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Creates a cyan rectangular region at (96, 93) spanning 93 by 104 pixels.
; PLAN: r0=96(x), r1=93(y), r2=93(width), r3=104(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 93
LDI r2, 93
LDI r3, 104
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
