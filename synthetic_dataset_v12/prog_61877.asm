; DESCRIPTION: Places a cyan 29x27 rectangle at position (89, 228).
; PLAN: r0=89(x), r1=228(y), r2=29(width), r3=27(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 228
LDI r2, 29
LDI r3, 27
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
