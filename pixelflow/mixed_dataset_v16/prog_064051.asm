; DESCRIPTION: Places a cyan 31x64 rectangle at position (245, 108).
; PLAN: r0=245(x), r1=108(y), r2=31(width), r3=64(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 108
LDI r2, 31
LDI r3, 64
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
