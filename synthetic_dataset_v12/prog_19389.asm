; DESCRIPTION: Places a green 116x86 rectangle at position (269, 150).
; PLAN: r0=269(x), r1=150(y), r2=116(width), r3=86(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 150
LDI r2, 116
LDI r3, 86
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
