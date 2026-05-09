; DESCRIPTION: Places a black 42x67 rectangle at position (294, 65).
; PLAN: r0=294(x), r1=65(y), r2=42(width), r3=67(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 65
LDI r2, 42
LDI r3, 67
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
