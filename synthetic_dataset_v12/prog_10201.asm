; DESCRIPTION: Creates a orange rectangular region at (284, 129) spanning 75 by 67 pixels.
; PLAN: r0=284(x), r1=129(y), r2=75(width), r3=67(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 129
LDI r2, 75
LDI r3, 67
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
