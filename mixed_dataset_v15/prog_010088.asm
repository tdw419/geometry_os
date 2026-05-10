; DESCRIPTION: Places a cyan 56x57 rectangle at position (294, 157).
; PLAN: r0=294(x), r1=157(y), r2=56(width), r3=57(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 157
LDI r2, 56
LDI r3, 57
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
