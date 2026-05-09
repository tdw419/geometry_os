; DESCRIPTION: Creates a red rectangular region at (226, 177) spanning 42 by 32 pixels.
; PLAN: r0=226(x), r1=177(y), r2=42(width), r3=32(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 177
LDI r2, 42
LDI r3, 32
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
