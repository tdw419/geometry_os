; DESCRIPTION: Places a cyan 63x27 rectangle at position (59, 25).
; PLAN: r0=59(x), r1=25(y), r2=63(width), r3=27(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 25
LDI r2, 63
LDI r3, 27
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
