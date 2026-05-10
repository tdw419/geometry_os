; DESCRIPTION: Places a cyan 82x44 rectangle at position (218, 162).
; PLAN: r0=218(x), r1=162(y), r2=82(width), r3=44(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 162
LDI r2, 82
LDI r3, 44
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
