; DESCRIPTION: Composite: . Then Creates a green rectangular region at (82, 42) spanning 109 by 64 pixels. Then Places a white dot at position (176, 131).
; PLAN: r0=82(x), r1=42(y), r2=109(width), r3=64(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=176(x), r1=131(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a green rectangular region at (82, 42) spanning 109 by 64 pixels.
; PLAN: r0=82(x), r1=42(y), r2=109(width), r3=64(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 42
LDI r2, 109
LDI r3, 64
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a white dot at position (176, 131).
; PLAN: r0=176(x), r1=131(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 176
LDI r1, 131
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
