; DESCRIPTION: Renders a cyan box of size 68x17 starting at (298, 42).
; PLAN: r0=298(x), r1=42(y), r2=68(width), r3=17(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 42
LDI r2, 68
LDI r3, 17
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
