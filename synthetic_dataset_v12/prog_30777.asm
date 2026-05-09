; DESCRIPTION: Places a green 48x16 rectangle at position (304, 206).
; PLAN: r0=304(x), r1=206(y), r2=48(width), r3=16(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 206
LDI r2, 48
LDI r3, 16
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
