; DESCRIPTION: Places a cyan 96x23 rectangle at position (394, 221).
; PLAN: r0=394(x), r1=221(y), r2=96(width), r3=23(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 221
LDI r2, 96
LDI r3, 23
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
