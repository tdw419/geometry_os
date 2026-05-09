; DESCRIPTION: Creates a red rectangular region at (190, 171) spanning 16 by 64 pixels.
; PLAN: r0=190(x), r1=171(y), r2=16(width), r3=64(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 171
LDI r2, 16
LDI r3, 64
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
