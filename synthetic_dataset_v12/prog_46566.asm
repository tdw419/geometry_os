; DESCRIPTION: Places a cyan 54x43 rectangle at position (263, 163).
; PLAN: r0=263(x), r1=163(y), r2=54(width), r3=43(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 163
LDI r2, 54
LDI r3, 43
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
