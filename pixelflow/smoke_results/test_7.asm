; DESCRIPTION : A si mp le pro g ra m th at load s 10 into r1 and de crement s it in a loop until it re ac he s 0 . It the n e nt ers a loop w h er e it w a it s for an o th er ke y p res s ( ' S ' ) to e x it s u b t ra ct ing a p pro ac ter i z on the screen . The loop includes a m a in _ 4 in stru ction to di sp lay a f ra me and re t u r n s to the start of the loop .

; input d ri ve n pro g ra m
; initi ali z ation
LDI r9, 0xF7ED91
LDI r25, 16
main_0:
IKEY r9
CMPI r9, 0x5137DF
JNZ r9, key_1
LDI r9, 0x997976
LDI r2, 4
LDI r4, 1
LDI r10, 4
RECTF r9, r2, r4, r10, r10
FRAME
JMP main_0