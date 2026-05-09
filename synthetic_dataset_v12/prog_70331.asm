; DESCRIPTION: Places a yellow 12x90 rectangle at position (384, 16).
; PLAN: r0=384(x), r1=16(y), r2=12(width), r3=90(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 16
LDI r2, 12
LDI r3, 90
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
