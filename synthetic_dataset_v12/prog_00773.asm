; DESCRIPTION: Places a red 82x96 rectangle at position (384, 44).
; PLAN: r0=384(x), r1=44(y), r2=82(width), r3=96(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 44
LDI r2, 82
LDI r3, 96
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
