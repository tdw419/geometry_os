; DESCRIPTION: Composite: . Then Creates a red rectangular region at (135, 52) spanning 116 by 22 pixels. Then Places a cyan dot at position (208, 79).
; PLAN: r0=135(x), r1=52(y), r2=116(width), r3=22(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=208(x), r1=79(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a red rectangular region at (135, 52) spanning 116 by 22 pixels.
; PLAN: r0=135(x), r1=52(y), r2=116(width), r3=22(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 52
LDI r2, 116
LDI r3, 22
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a cyan dot at position (208, 79).
; PLAN: r0=208(x), r1=79(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 208
LDI r1, 79
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
