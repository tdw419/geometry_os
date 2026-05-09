; DESCRIPTION: Places a yellow 48x64 rectangle at position (248, 103).
; PLAN: r0=248(x), r1=103(y), r2=48(width), r3=64(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 103
LDI r2, 48
LDI r3, 64
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
