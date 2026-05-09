; DESCRIPTION: Places a cyan 61x54 rectangle at position (68, 133).
; PLAN: r0=68(x), r1=133(y), r2=61(width), r3=54(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 133
LDI r2, 61
LDI r3, 54
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
