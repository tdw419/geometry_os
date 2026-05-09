; DESCRIPTION: Renders a cyan box of size 62x103 starting at (281, 16).
; PLAN: r0=281(x), r1=16(y), r2=62(width), r3=103(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 16
LDI r2, 62
LDI r3, 103
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
