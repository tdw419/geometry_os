; DESCRIPTION: Places a cyan 73x63 rectangle at position (60, 92).
; PLAN: r0=60(x), r1=92(y), r2=73(width), r3=63(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 92
LDI r2, 73
LDI r3, 63
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
